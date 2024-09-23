@implementation HDKeyValueEntity

+ (BOOL)setData:(id)a3 forKey:(id)a4 domain:(id)a5 category:(int64_t)a6 profile:(id)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  void *v23;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueEntity.m"), 297, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(data == nil) || [data isKindOfClass:[NSData class]]"));

    }
  }
  v24 = v16;
  _HDSQLiteValueForData();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = +[HDKeyValueEntity _setRawKeysAndValues:domain:category:profile:error:]((uint64_t)a1, v20, v17, a6, v18, (uint64_t)a8);
  return v21;
}

+ (uint64_t)_setRawKeysAndValues:(void *)a3 domain:(uint64_t)a4 category:(void *)a5 profile:(uint64_t)a6 error:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v18;
  void *v19;

  v10 = a5;
  v11 = a3;
  v12 = a2;
  v13 = (void *)objc_opt_self();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", sel__setRawKeysAndValues_domain_category_profile_error_, v13, CFSTR("HDKeyValueEntity.m"), 646, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keysAndValues != nil"));

  }
  v14 = (void *)objc_opt_self();
  if (v14 != (void *)objc_msgSend(v14, "_entityClassForKeyValueCategory:", a4))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", sel__setRawKeysAndValues_domain_category_profile_error_, v13, CFSTR("HDKeyValueEntity.m"), 647, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _validateEntityClassForCategory:category]"));

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "_insertKeysAndValues:modificationDate:domain:category:provenance:syncIdentity:updatePolicy:profile:error:", v12, v15, v11, a4, 0, -2, 1, v10, a6);

  return v16;
}

+ (Class)_entityClassForKeyValueCategory:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 - 100) >= 8 && (unint64_t)a3 > 5)
  {
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v6 = v5;
      v8 = 138543618;
      v9 = (id)objc_opt_class();
      v10 = 2048;
      v11 = a3;
      v7 = v9;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@: unrecognized category %ld", (uint8_t *)&v8, 0x16u);

    }
    return (Class)0;
  }
  else
  {
    objc_opt_class();
    return (Class)(id)objc_claimAutoreleasedReturnValue();
  }
}

+ (id)dateForKey:(id)a3 domain:(id)a4 category:(int64_t)a5 profile:(id)a6 entity:(id *)a7 error:(id *)a8
{
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;

  v14 = a3;
  +[HDKeyValueEntity _rawValueForKey:domain:category:profile:entity:error:]((uint64_t)a1, v14, a4, a5, a6, a7, (uint64_t)a8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v17 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("Found unexpected type %@ for key %@, expecting %@"), objc_opt_class(), v14, v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (a8)
        *a8 = objc_retainAutorelease(v18);
      else
        _HKLogDroppedError();
    }

    v16 = 0;
  }
  else
  {
    _HDDateForSQLiteValue();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

+ (id)_rawValueForKey:(void *)a3 domain:(uint64_t)a4 category:(void *)a5 profile:(_QWORD *)a6 entity:(uint64_t)a7 error:
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[8];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v12 = a2;
  v13 = a3;
  v14 = a5;
  v15 = objc_opt_self();
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__172;
  v33 = __Block_byref_object_dispose__172;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__172;
  v27 = __Block_byref_object_dispose__172;
  v28 = 0;
  if (v12)
  {
    v16 = v15;
    v35[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __73__HDKeyValueEntity__rawValueForKey_domain_category_profile_entity_error___block_invoke;
    v22[3] = &unk_1E6D0BBD8;
    v22[4] = &v29;
    v22[5] = &v23;
    v22[6] = a6;
    v22[7] = v16;
    v18 = +[HDKeyValueEntity _valuesForKeys:domain:category:profile:error:handler:](v16, v17, v13, a4, v14, a7, v22);

  }
  if (a6)
  {
    v19 = (void *)v24[5];
    if (v19)
      *a6 = objc_retainAutorelease(v19);
  }
  v20 = (id)v30[5];
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v20;
}

+ (id)_valuesForKeys:(void *)a3 domain:(uint64_t)a4 category:(void *)a5 profile:(uint64_t)a6 error:(void *)a7 handler:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  char v25;
  void *v26;
  id v27;
  void *v29;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a7;
  v13 = a5;
  v14 = a3;
  v15 = (void *)objc_opt_self();
  if (!objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", sel__valuesForKeys_domain_category_profile_error_handler_, v15, CFSTR("HDKeyValueEntity.m"), 559, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[keys count] > 0"));

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDKeyValueEntity _predicateForKeys:]((uint64_t)v15, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDKeyValueEntity _predicateForDomain:]((uint64_t)v15, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0D29840];
  v34[0] = v18;
  v34[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "predicateMatchingAllPredicates:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "database");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __73__HDKeyValueEntity__valuesForKeys_domain_category_profile_error_handler___block_invoke;
  v31[3] = &unk_1E6D0BC68;
  v33 = v12;
  v23 = v16;
  v32 = v23;
  v24 = v12;
  v25 = objc_msgSend(v15, "_enumerateKeyValueEntitiesInCategory:predicate:healthDatabase:error:usingBlock:", a4, v21, v22, a6, v31);

  if ((v25 & 1) == 0)
  {

    v23 = 0;
  }
  v26 = v32;
  v27 = v23;

  return v27;
}

+ (id)_predicateForKeys:(uint64_t)a1
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_self();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D29848], "containsPredicateWithProperty:values:", CFSTR("key"), v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)_predicateForDomain:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v6;
  void *v7;

  v2 = a2;
  v3 = objc_opt_self();
  if (!v2)
  {
    v6 = v3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel__predicateForDomain_, v6, CFSTR("HDKeyValueEntity.m"), 1096, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("domain != nil"));

  }
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("domain"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)_enumerateKeyValueEntitiesInCategory:(int64_t)a3 predicate:(id)a4 healthDatabase:(id)a5 error:(id *)a6 usingBlock:(id)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  char v19;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  int64_t v26;

  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = (void *)objc_opt_self();
  if (v16 != (void *)objc_msgSend(v16, "_entityClassForKeyValueCategory:", a3))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueEntity.m"), 626, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _validateEntityClassForCategory:category]"));

  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __99__HDKeyValueEntity__enumerateKeyValueEntitiesInCategory_predicate_healthDatabase_error_usingBlock___block_invoke;
  v22[3] = &unk_1E6CE91E0;
  v25 = a1;
  v26 = a3;
  v23 = v13;
  v24 = v15;
  v17 = v15;
  v18 = v13;
  v19 = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v14, a6, v22);

  return v19;
}

uint64_t __99__HDKeyValueEntity__enumerateKeyValueEntitiesInCategory_predicate_healthDatabase_error_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(void **)(a1 + 32);
  objc_msgSend(a2, "databaseForEntityClass:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[HDKeyValueEntity _readRawValuesInCategory:predicate:database:error:usingBlock:](v5, v6, v7, v8, a3, *(void **)(a1 + 40));

  return v9;
}

+ (uint64_t)_readRawValuesInCategory:(void *)a3 predicate:(void *)a4 database:(uint64_t)a5 error:(void *)a6 usingBlock:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_self();
  v23[0] = CFSTR("domain");
  v23[1] = CFSTR("key");
  v23[2] = CFSTR("value");
  v23[3] = CFSTR("mod_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDKeyValueEntity _predicateForCategory:]((uint64_t)v13, a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v15, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "queryWithDatabase:predicate:", v11, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __81__HDKeyValueEntity__readRawValuesInCategory_predicate_database_error_usingBlock___block_invoke;
  v21[3] = &unk_1E6CE84F0;
  v22 = v10;
  v18 = v10;
  v19 = objc_msgSend(v17, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v14, a5, v21);

  return v19;
}

+ (id)_predicateForCategory:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_self();
  v3 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithProperty:equalToValue:", CFSTR("category"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL __81__HDKeyValueEntity__readRawValuesInCategory_predicate_database_error_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  char v12;

  MEMORY[0x1BCCAB1D4](a4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1D4](a4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB1BC](a4, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB198](a4, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v10 = v12 == 0;

  return v10;
}

void __73__HDKeyValueEntity__valuesForKeys_domain_category_profile_error_handler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = *(_QWORD *)(a1 + 40);
  if (v14)
  {
    (*(void (**)(uint64_t, id, id, id, uint64_t))(v14 + 16))(v14, v11, v12, v13, a6);
    v15 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v15;
  }
  if (v12)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, v11);

}

id __73__HDKeyValueEntity__rawValueForKey_domain_category_profile_entity_error___block_invoke(_QWORD *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqual:", v8))
    v9 = 0;
  else
    v9 = v7;
  objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), v9);

  if (a1[6])
  {
    v10 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPersistentID:", a5);
    v11 = *(_QWORD *)(a1[5] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  v13 = *(id *)(*(_QWORD *)(a1[4] + 8) + 40);

  return v13;
}

+ (BOOL)setDate:(id)a3 forKey:(id)a4 domain:(id)a5 category:(int64_t)a6 profile:(id)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  void *v23;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueEntity.m"), 334, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(date == nil) || [date isKindOfClass:[NSDate class]]"));

    }
  }
  v24 = v16;
  _HDSQLiteValueForDate();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = +[HDKeyValueEntity _setRawKeysAndValues:domain:category:profile:error:]((uint64_t)a1, v20, v17, a6, v18, (uint64_t)a8);
  return v21;
}

+ (id)numberForKey:(id)a3 domain:(id)a4 category:(int64_t)a5 profile:(id)a6 entity:(id *)a7 error:(id *)a8
{
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;

  v14 = a3;
  +[HDKeyValueEntity _rawValueForKey:domain:category:profile:entity:error:]((uint64_t)a1, v14, a4, a5, a6, a7, (uint64_t)a8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v17 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("Found unexpected type %@ for key %@, expecting %@"), objc_opt_class(), v14, v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (a8)
        *a8 = objc_retainAutorelease(v18);
      else
        _HKLogDroppedError();
    }

    v16 = 0;
  }
  else
  {
    v16 = v15;
  }

  return v16;
}

+ (id)retrieveDatabaseIdentifierFromDatabase:(id)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueEntity+DatabaseProperties.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

  }
  v8 = objc_msgSend(a1, "_deviceLocalCategory");
  v15[0] = CFSTR("IDENTIFIER");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_rawValuesForKeys:domain:category:database:error:", v9, CFSTR("DATABASE_CREATION"), v8, v7, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10 && !*a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueEntity+DatabaseProperties.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("values || *error"));

  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("IDENTIFIER"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_rawValuesForKeys:(id)a3 domain:(id)a4 category:(int64_t)a5 database:(id)a6 error:(id *)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;

  v12 = (void *)MEMORY[0x1E0C99E08];
  v13 = a6;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v12, "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDKeyValueEntity _predicateForKeys:]((uint64_t)a1, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDKeyValueEntity _predicateForDomain:]((uint64_t)a1, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v18, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __69__HDKeyValueEntity__rawValuesForKeys_domain_category_database_error___block_invoke;
  v22[3] = &unk_1E6D0BC00;
  v20 = v16;
  v23 = v20;
  LOBYTE(a7) = +[HDKeyValueEntity _readRawValuesInCategory:predicate:database:error:usingBlock:]((uint64_t)a1, a5, v19, v13, (uint64_t)a7, v22);

  if ((a7 & 1) == 0)
  {

    v20 = 0;
  }

  return v20;
}

void __69__HDKeyValueEntity__rawValuesForKeys_domain_category_database_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  id v14;

  v14 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "isEqual:", v12);

    if ((v13 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v9);
  }

}

+ (int64_t)_deviceLocalCategory
{
  return 0;
}

+ (BOOL)setNumber:(id)a3 forKey:(id)a4 domain:(id)a5 category:(int64_t)a6 profile:(id)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  void *v23;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueEntity.m"), 376, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(number == nil) || [number isKindOfClass:[NSNumber class]]"));

    }
  }
  v24 = v16;
  _HDSQLiteValueForNumber();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = +[HDKeyValueEntity _setRawKeysAndValues:domain:category:profile:error:]((uint64_t)a1, v20, v17, a6, v18, (uint64_t)a8);
  return v21;
}

+ (BOOL)enumerateValuesForDomain:(id)a3 category:(int64_t)a4 keys:(id)a5 profile:(id)a6 error:(id *)a7 usingBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v15 = a8;
  v16 = a6;
  +[HDKeyValueEntity _predicateForDomain:]((uint64_t)a1, a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
    +[HDKeyValueEntity _predicateForKeys:]((uint64_t)a1, v14);
  else
    objc_msgSend(MEMORY[0x1E0D29890], "truePredicate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0D29840];
  v25[0] = v17;
  v25[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "predicateMatchingAllPredicates:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "database");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(a1, "_enumerateKeyValueEntitiesInCategory:predicate:healthDatabase:error:usingBlock:", a4, v21, v22, a7, v15);
  return v23;
}

+ (id)allValuesForDomain:(id)a3 category:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;

  v10 = (void *)MEMORY[0x1E0C99E08];
  v11 = a5;
  v12 = a3;
  objc_msgSend(v10, "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDKeyValueEntity _predicateForDomain:]((uint64_t)a1, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __62__HDKeyValueEntity_allValuesForDomain_category_profile_error___block_invoke;
  v22[3] = &unk_1E6D0BB70;
  v23 = v14;
  v17 = v13;
  v24 = v17;
  v18 = v14;
  LOBYTE(a6) = objc_msgSend(a1, "_enumerateKeyValueEntitiesInCategory:predicate:healthDatabase:error:usingBlock:", a4, v15, v16, a6, v22);

  if ((a6 & 1) == 0)
  {

    v17 = 0;
  }
  v19 = v24;
  v20 = v17;

  return v20;
}

+ (id)propertyForSyncProvenance
{
  return CFSTR("provenance");
}

+ (id)dataForKey:(id)a3 domain:(id)a4 category:(int64_t)a5 profile:(id)a6 entity:(id *)a7 error:(id *)a8
{
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;

  v14 = a3;
  +[HDKeyValueEntity _rawValueForKey:domain:category:profile:entity:error:]((uint64_t)a1, v14, a4, a5, a6, a7, (uint64_t)a8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v17 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("Found unexpected type %@ for key %@, expecting %@"), objc_opt_class(), v14, v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (a8)
        *a8 = objc_retainAutorelease(v18);
      else
        _HKLogDroppedError();
    }

    v16 = 0;
  }
  else
  {
    v16 = v15;
  }

  return v16;
}

+ (id)stringForKey:(id)a3 domain:(id)a4 category:(int64_t)a5 profile:(id)a6 entity:(id *)a7 error:(id *)a8
{
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;

  v14 = a3;
  +[HDKeyValueEntity _rawValueForKey:domain:category:profile:entity:error:]((uint64_t)a1, v14, a4, a5, a6, a7, (uint64_t)a8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v17 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("Found unexpected type %@ for key %@, expecting %@"), objc_opt_class(), v14, v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (a8)
        *a8 = objc_retainAutorelease(v18);
      else
        _HKLogDroppedError();
    }

    v16 = 0;
  }
  else
  {
    v16 = v15;
  }

  return v16;
}

+ (id)retrieveDatabaseIdentifierFromProfile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a1, "dataForKey:domain:category:profile:entity:error:", CFSTR("IDENTIFIER"), CFSTR("DATABASE_CREATION"), objc_msgSend(a1, "_deviceLocalCategory"), v6, 0, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)dateComponentsForKey:(id)a3 domain:(id)a4 category:(int64_t)a5 profile:(id)a6 entity:(id *)a7 error:(id *)a8
{
  void *v8;
  void *v9;

  objc_msgSend(a1, "dateForKey:domain:category:profile:entity:error:", a3, a4, a5, a6, a7, a8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "hk_canonicalDateOfBirthDateComponentsWithDate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)quantityForKey:(id)a3 unit:(id)a4 domain:(id)a5 category:(int64_t)a6 profile:(id)a7 entity:(id *)a8 error:(id *)a9
{
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v15 = a3;
  v16 = a4;
  +[HDKeyValueEntity _rawValueForKey:domain:category:profile:entity:error:]((uint64_t)a1, v15, a5, a6, a7, a8, (uint64_t)a9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v19 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("Found unexpected type %@ for key %@, expecting %@"), objc_opt_class(), v15, v19);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      if (a9)
        *a9 = objc_retainAutorelease(v20);
      else
        _HKLogDroppedError();
    }

    v18 = 0;
  }
  else
  {
    _HDQuantityForSQLiteValue();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

+ (BOOL)setValuesWithDictionary:(id)a3 domain:(id)a4 category:(int64_t)a5 profile:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  char v15;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  if (objc_msgSend(v12, "count"))
    v15 = +[HDKeyValueEntity _setRawKeysAndValues:domain:category:profile:error:]((uint64_t)a1, v12, v13, a5, v14, (uint64_t)a7);
  else
    v15 = 1;

  return v15;
}

void __62__HDKeyValueEntity_allValuesForDomain_category_profile_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;

  v12 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v10 && (objc_msgSend(v10, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v9);

}

+ (id)generateNewDatabaseIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_dataForUUIDBytes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)persistDatabaseIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;

  v8 = a4;
  v9 = a3;
  LOBYTE(a5) = objc_msgSend(a1, "setData:forKey:domain:category:profile:error:", v9, CFSTR("IDENTIFIER"), CFSTR("DATABASE_CREATION"), objc_msgSend(a1, "_deviceLocalCategory"), v8, a5);

  return (char)a5;
}

+ (id)retrieveDatabaseIdentifierCreationDateFromProfile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a1, "_modDateForKey:domain:category:profile:entity:error:", CFSTR("IDENTIFIER"), CFSTR("DATABASE_CREATION"), objc_msgSend(a1, "_deviceLocalCategory"), v6, 0, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)persistDatabaseIdentifier:(id)a3 syncIdentity:(int64_t)a4 database:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  void *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueEntity+DatabaseProperties.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(data == nil) || [data isKindOfClass:[NSData class]]"));

    }
  }
  v18 = CFSTR("IDENTIFIER");
  _HDSQLiteValueForData();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(a1, "_setRawKeysAndValues:domain:category:syncIdentity:database:error:", v14, CFSTR("DATABASE_CREATION"), objc_msgSend(a1, "_deviceLocalCategory"), a4, v12, a6);
  return v15;
}

+ (BOOL)setOkemoZursObjectAnchor:(int64_t)a3 syncIdentity:(int64_t)a4 database:(id)a5 error:(id *)a6
{
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v16 = CFSTR("OBJECT_ANCHOR_8_2");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = a5;
  objc_msgSend(v10, "numberWithLongLong:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _HDSQLiteValueForNumber();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a6) = objc_msgSend(a1, "_setRawKeysAndValues:domain:category:syncIdentity:database:error:", v14, CFSTR("OBJECT_ANCHOR"), objc_msgSend(a1, "_deviceLocalCategory"), a4, v11, a6);
  return (char)a6;
}

+ (id)okemoZursObjectAnchorWithProfile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a1, "numberForKey:domain:category:profile:entity:error:", CFSTR("OBJECT_ANCHOR_8_2"), CFSTR("OBJECT_ANCHOR"), objc_msgSend(a1, "_deviceLocalCategory"), v6, 0, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)valuesForKeys:(id)a3 domain:(id)a4 category:(int64_t)a5 profile:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;

  v11 = a6;
  v12 = a4;
  v13 = a3;
  v14 = objc_opt_self();
  +[HDKeyValueEntity _valuesForKeys:domain:category:profile:error:handler:](v14, v13, v12, a5, v11, (uint64_t)a7, &__block_literal_global_238_1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)modificationDatesForKeys:(id)a3 domain:(id)a4 category:(int64_t)a5 profile:(id)a6 error:(id *)a7
{
  return +[HDKeyValueEntity _valuesForKeys:domain:category:profile:error:handler:]((uint64_t)a1, a3, a4, a5, a6, (uint64_t)a7, &__block_literal_global_211);
}

id __75__HDKeyValueEntity_modificationDatesForKeys_domain_category_profile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return a4;
}

+ (BOOL)setData:(id)a3 forKey:(id)a4 domain:(id)a5 category:(int64_t)a6 syncIdentity:(int64_t)a7 profile:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueEntity.m"), 310, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(data == nil) || [data isKindOfClass:[NSData class]]"));

    }
  }
  v29 = v16;
  _HDSQLiteValueForData();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueEntity.m"), 312, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dict != nil"));

  }
  v21 = (void *)objc_opt_self();
  if (v21 != (void *)objc_msgSend(v21, "_entityClassForKeyValueCategory:", a6))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueEntity.m"), 313, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _validateEntityClassForCategory:category]"));

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(a1, "_insertKeysAndValues:modificationDate:domain:category:provenance:syncIdentity:updatePolicy:profile:error:", v20, v22, v17, a6, 0, a7, 1, v18, a9);

  return v23;
}

+ (BOOL)setDateComponents:(id)a3 forKey:(id)a4 domain:(id)a5 category:(int64_t)a6 profile:(id)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v25;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueEntity.m"), 346, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(dateComponents == nil) || [dateComponents isKindOfClass:[NSDateComponents class]]"));

    }
    objc_msgSend(v15, "calendar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");

    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTimeZone:", v21);

    objc_msgSend(v20, "dateFromComponents:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }
  v23 = objc_msgSend(a1, "setDate:forKey:domain:category:profile:error:", v22, v16, v17, a6, v18, a8);

  return v23;
}

+ (BOOL)setQuantity:(id)a3 unit:(id)a4 forKey:(id)a5 domain:(id)a6 category:(int64_t)a7 profile:(id)a8 error:(id *)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  char v23;
  void *v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueEntity.m"), 364, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("quanity == nil || [quanity isKindOfClass:[HKQuantity class]]"));

    }
  }
  v26 = v18;
  _HDSQLiteValueForQuantity();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = +[HDKeyValueEntity _setRawKeysAndValues:domain:category:profile:error:]((uint64_t)a1, v22, v19, a7, v20, (uint64_t)a9);
  return v23;
}

+ (BOOL)setString:(id)a3 forKey:(id)a4 domain:(id)a5 category:(int64_t)a6 profile:(id)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  void *v23;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueEntity.m"), 388, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(string == nil) || [string isKindOfClass:[NSString class]]"));

    }
  }
  v24 = v16;
  _HDSQLiteValueForString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = +[HDKeyValueEntity _setRawKeysAndValues:domain:category:profile:error:]((uint64_t)a1, v20, v17, a6, v18, (uint64_t)a8);
  return v21;
}

+ (BOOL)removeValuesForDomain:(id)a3 category:(int64_t)a4 keys:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  if (v13 && !objc_msgSend(v13, "count"))
  {
    v22 = 1;
  }
  else
  {
    +[HDKeyValueEntity _predicateForDomain:]((uint64_t)a1, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDKeyValueEntity _predicateForCategory:]((uint64_t)a1, a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      +[HDKeyValueEntity _predicateForKeys:]((uint64_t)a1, v13);
    else
      objc_msgSend(MEMORY[0x1E0D29890], "truePredicate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0D29840];
    v24[0] = v15;
    v24[1] = v16;
    v24[2] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "predicateMatchingAllPredicates:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "database");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(a1, "deleteEntitiesWithPredicate:healthDatabase:error:", v20, v21, a7);

  }
  return v22;
}

+ (BOOL)setValueForAllKeys:(id)a3 domain:(id)a4 category:(int64_t)a5 profile:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  int64_t v33;
  id v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  objc_msgSend(v13, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDKeyValueEntity _predicateForDomain:]((uint64_t)a1, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDKeyValueEntity _predicateForCategory:]((uint64_t)a1, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0D29840];
  v35[0] = v15;
  v35[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "predicateMatchingAllPredicates:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __69__HDKeyValueEntity_setValueForAllKeys_domain_category_profile_error___block_invoke;
  v27[3] = &unk_1E6CE9168;
  v28 = v13;
  v29 = v12;
  v33 = a5;
  v34 = a1;
  v30 = v19;
  v31 = v14;
  v32 = v11;
  v20 = v11;
  v21 = v14;
  v22 = v19;
  v23 = v12;
  v24 = v13;
  LOBYTE(v18) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v21, a7, v27);

  return (char)v18;
}

uint64_t __69__HDKeyValueEntity_setValueForAllKeys_domain_category_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "keyValueDomainManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "batchNotificationForDomain:category:forTransaction:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), v6);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 80);
  v19[0] = CFSTR("value");
  v19[1] = CFSTR("mod_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__HDKeyValueEntity_setValueForAllKeys_domain_category_profile_error___block_invoke_2;
  v16[3] = &unk_1E6CE89A8;
  v17 = *(id *)(a1 + 64);
  v18 = v8;
  v13 = v8;
  v14 = objc_msgSend(v9, "updateProperties:predicate:healthDatabase:error:bindingHandler:", v10, v11, v12, a3, v16);

  return v14;
}

void __69__HDKeyValueEntity_setValueForAllKeys_domain_category_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1BCCAB15C](a2, CFSTR("value"), *(_QWORD *)(a1 + 32));
  JUMPOUT(0x1BCCAB0E4);
}

id __68__HDKeyValueEntity__rawValuesForKeys_domain_category_profile_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0C99E38];
  v4 = a3;
  objc_msgSend(v3, "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", v5))
    v6 = 0;
  else
    v6 = v4;
  v7 = v6;

  return v7;
}

+ (BOOL)_setRawKeysAndValues:(id)a3 domain:(id)a4 category:(int64_t)a5 syncIdentity:(int64_t)a6 database:(id)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  BOOL v34;
  void *v36;
  void *v37;
  int64_t v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;

  v15 = a3;
  v16 = a4;
  v17 = a7;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueEntity.m"), 668, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keysAndValues != nil"));

  }
  v18 = (void *)objc_opt_self();
  if (v18 != (void *)objc_msgSend(v18, "_entityClassForKeyValueCategory:", a5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueEntity.m"), 669, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _validateEntityClassForCategory:category]"));

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v15;
  v21 = v19;
  v22 = v16;
  v23 = v17;
  v24 = objc_opt_self();
  v25 = objc_msgSend(v20, "count");
  if (v25)
  {
    v26 = v25;
    v38 = a5;
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v25);
    v28 = a8;
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v26);
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v26);
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __126__HDKeyValueEntity__insertKeysAndValues_modificationDate_domain_category_provenance_syncIdentity_updatePolicy_database_error___block_invoke;
    v39[3] = &unk_1E6D0BC90;
    v40 = v27;
    v41 = v29;
    v42 = v30;
    v43 = v21;
    v31 = v30;
    v32 = v29;
    v33 = v27;
    objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v39);
    v34 = +[HDKeyValueEntity _doInsertValues:forKeys:modificationDates:domain:category:provenance:syncIdentity:updatePolicy:database:error:](v24, v33, v32, v31, v22, v38, 0, a6, 1, v23, (uint64_t)v28);

  }
  else
  {
    v34 = 1;
  }

  return v34;
}

+ (BOOL)_insertKeysAndValues:(id)a3 modificationDate:(id)a4 domain:(id)a5 category:(int64_t)a6 provenance:(int64_t)a7 syncIdentity:(int64_t)a8 updatePolicy:(int64_t)a9 profile:(id)a10 error:(id *)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  char v29;
  int64_t v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a10;
  v21 = objc_msgSend(v17, "count");
  if (v21)
  {
    v22 = v21;
    v32 = a1;
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v21);
    v31 = a7;
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v22);
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v22);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __125__HDKeyValueEntity__insertKeysAndValues_modificationDate_domain_category_provenance_syncIdentity_updatePolicy_profile_error___block_invoke;
    v33[3] = &unk_1E6D0BC90;
    v34 = v23;
    v35 = v24;
    v36 = v25;
    v37 = v18;
    v26 = v25;
    v27 = v24;
    v28 = v23;
    objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v33);
    v29 = objc_msgSend(v32, "_insertValues:forKeys:modificationDates:domain:category:provenance:syncIdentity:updatePolicy:profile:error:", v28, v27, v26, v19, a6, v31, a8, a9, v20, a11);

  }
  else
  {
    v29 = 1;
  }

  return v29;
}

uint64_t __125__HDKeyValueEntity__insertKeysAndValues_modificationDate_domain_category_provenance_syncIdentity_updatePolicy_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "addObject:", a3);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

  return objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(a1 + 56));
}

uint64_t __126__HDKeyValueEntity__insertKeysAndValues_modificationDate_domain_category_provenance_syncIdentity_updatePolicy_database_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "addObject:", a3);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

  return objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(a1 + 56));
}

+ (BOOL)_doInsertValues:(void *)a3 forKeys:(void *)a4 modificationDates:(void *)a5 domain:(uint64_t)a6 category:(uint64_t)a7 provenance:(uint64_t)a8 syncIdentity:(uint64_t)a9 updatePolicy:(void *)a10 database:(uint64_t)a11 error:
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  char v41;
  BOOL v42;
  void *v43;
  void *v44;
  void *v45;
  id v47;
  id v48;
  uint64_t v49;
  void *v52;
  unint64_t v54;
  id v55;
  BOOL v56;
  id v57;
  id v58;
  void *v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[5];
  _QWORD v69[5];
  _QWORD v70[4];
  id v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  char v78;

  v14 = a2;
  v15 = a3;
  v16 = a4;
  v58 = a5;
  v57 = a10;
  v59 = (void *)objc_opt_self();
  v17 = objc_msgSend(v15, "count");
  if (objc_msgSend(v14, "count") != v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", sel__doInsertValues_forKeys_modificationDates_domain_category_provenance_syncIdentity_updatePolicy_database_error_, v59, CFSTR("HDKeyValueEntity.m"), 898, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[values count] == count"));

  }
  if (objc_msgSend(v16, "count") != v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", sel__doInsertValues_forKeys_modificationDates_domain_category_provenance_syncIdentity_updatePolicy_database_error_, v59, CFSTR("HDKeyValueEntity.m"), 899, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[dates count] == count"));

  }
  if (v58)
  {
    if (v17)
      goto LABEL_7;
LABEL_24:
    v56 = 1;
    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", sel__doInsertValues_forKeys_modificationDates_domain_category_provenance_syncIdentity_updatePolicy_database_error_, v59, CFSTR("HDKeyValueEntity.m"), 900, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("domain != nil"));

  if (!v17)
    goto LABEL_24;
LABEL_7:
  v54 = v17;
  v56 = 0;
  v18 = 0;
  v19 = a9;
  v49 = *MEMORY[0x1E0D29618];
  v55 = v16;
  v47 = v15;
  v48 = v14;
  do
  {
    objc_msgSend(v15, "objectAtIndexedSubscript:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "timeIntervalSinceReferenceDate");
    v24 = v23;

    v25 = v20;
    v26 = v58;
    v27 = v57;
    objc_opt_self();
    if (v19 == 2)
    {
      v52 = v21;
      v28 = v25;
      v29 = v26;
      v30 = v27;
      v31 = (void *)objc_opt_self();
      v32 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v31, "disambiguatedDatabaseTable");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@ = ? AND %@ = ? AND %@ = ? AND %@ >= ?;"),
        v49,
        v33,
        CFSTR("category"),
        CFSTR("domain"),
        CFSTR("key"),
        CFSTR("mod_date"),
        0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v75 = 0;
      v76 = &v75;
      v77 = 0x2020000000;
      v78 = 1;
      v35 = MEMORY[0x1E0C809B0];
      v70[0] = MEMORY[0x1E0C809B0];
      v70[1] = 3221225472;
      v70[2] = __107__HDKeyValueEntity__validateModificationDatePolicyWithKey_domain_category_modificationDate_database_error___block_invoke;
      v70[3] = &unk_1E6CF9A50;
      v73 = a6;
      v36 = v29;
      v71 = v36;
      v37 = v28;
      v72 = v37;
      v74 = v24;
      v69[0] = v35;
      v69[1] = 3221225472;
      v69[2] = __107__HDKeyValueEntity__validateModificationDatePolicyWithKey_domain_category_modificationDate_database_error___block_invoke_2;
      v69[3] = &unk_1E6CE8540;
      v69[4] = &v75;
      if (objc_msgSend(v30, "executeSQL:error:bindingHandler:enumerationHandler:", v34, a11, v70, v69))
      {
        if (*((_BYTE *)v76 + 24))
          v19 = 1;
        else
          v19 = 2;
      }
      else
      {
        v19 = 3;
      }
      v21 = v52;

      _Block_object_dispose(&v75, 8);
      v15 = v47;
      v14 = v48;
    }
    else if (v19 != 1)
    {
      v19 = 0;
    }

    if (v19 == 1)
    {
      v38 = objc_msgSend(v59, "_insertStatementKey");
      v68[0] = MEMORY[0x1E0C809B0];
      v68[1] = 3221225472;
      v68[2] = __130__HDKeyValueEntity__doInsertValues_forKeys_modificationDates_domain_category_provenance_syncIdentity_updatePolicy_database_error___block_invoke;
      v68[3] = &__block_descriptor_40_e15___NSString_8__0l;
      v68[4] = v59;
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __130__HDKeyValueEntity__doInsertValues_forKeys_modificationDates_domain_category_provenance_syncIdentity_updatePolicy_database_error___block_invoke_2;
      v60[3] = &unk_1E6D0BCE0;
      v61 = v21;
      v62 = v25;
      v63 = v26;
      v64 = a6;
      v65 = a7;
      v66 = v24;
      v67 = a8;
      v39 = v25;
      v40 = v21;
      v41 = objc_msgSend(v27, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", v38, a11, v68, v60, 0);

      v19 = a9;
      v16 = v55;
      if ((v41 & 1) == 0)
        break;
    }
    else
    {

      v42 = v19 == 3;
      v19 = a9;
      v16 = v55;
      if (v42)
        break;
    }
    v56 = ++v18 >= v54;
  }
  while (v54 != v18);
LABEL_25:

  return v56;
}

+ (BOOL)_insertCodableCategoryDomainDictionary:(id)a3 provenance:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  char v11;
  id v13;
  id v14;
  id v15;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "_validateForInsertionWithError:", a6))
  {
    objc_msgSend(v8, "keyValuePairs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      v13 = v8;
      v14 = v10;
      v15 = v9;
      v11 = HKWithAutoreleasePool();

    }
    else
    {
      v11 = 1;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __84__HDKeyValueEntity__insertCodableCategoryDomainDictionary_provenance_profile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v25;
  __CFString *v26;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v25 = *(_QWORD *)(v3 + 8);
  v4 = *(__CFString **)(v3 + 16);
  if (!v4)
    v4 = &stru_1E6D11BB8;
  v26 = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 56));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 56));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 56));
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v28 = a1;
  v8 = *(id *)(a1 + 40);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v40 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v12, "decodedValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v5, "addObject:", v13);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

        }
        objc_msgSend(v12, "key");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v15);

        objc_msgSend(v12, "decodedTimestamp");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v16);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v9);
  }

  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__172;
  v37 = __Block_byref_object_dispose__172;
  objc_msgSend(*(id *)(v28 + 48), "syncIdentityManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "legacySyncIdentity");
  v38 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(v28 + 48), "database");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __84__HDKeyValueEntity__insertCodableCategoryDomainDictionary_provenance_profile_error___block_invoke_2;
  v29[3] = &unk_1E6CF0008;
  v30 = *(id *)(v28 + 32);
  v32 = &v33;
  v31 = *(id *)(v28 + 48);
  v19 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSyncIdentityEntity, "performWriteTransactionWithHealthDatabase:error:block:", v18, a2, v29);

  if (v19)
  {
    v21 = *(void **)(v28 + 64);
    v20 = *(_QWORD *)(v28 + 72);
    objc_msgSend((id)v34[5], "entity");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "_insertValues:forKeys:modificationDates:domain:category:provenance:syncIdentity:updatePolicy:profile:error:", v5, v6, v7, v26, v25, v20, objc_msgSend(v22, "persistentID"), 2, *(_QWORD *)(v28 + 48), a2);

  }
  else
  {
    v23 = 0;
  }

  _Block_object_dispose(&v33, 8);
  return v23;
}

uint64_t __84__HDKeyValueEntity__insertCodableCategoryDomainDictionary_provenance_profile_error___block_invoke_2(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "hasSyncIdentity"))
  {
    objc_msgSend(*(id *)(a1 + 32), "syncIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    +[HDSyncIdentity syncIdentityWithCodable:error:](HDSyncIdentity, "syncIdentityWithCodable:error:", v6, &v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v19;

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "syncIdentityManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v8;
      v10 = 1;
      objc_msgSend(v9, "concreteIdentityForIdentity:shouldCreate:transaction:error:", v7, 1, v5, &v18);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v18;

      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v11;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      {
LABEL_16:

        goto LABEL_17;
      }
      _HKInitializeLogging();
      v15 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v12;
        _os_log_fault_impl(&dword_1B7802000, v15, OS_LOG_TYPE_FAULT, "HDKeyValueEntity ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0xCu);
      }
      v12 = v12;
      if (!v12)
      {
LABEL_15:

        v10 = 0;
        goto LABEL_16;
      }
      if (!a3)
      {
LABEL_8:
        _HKLogDroppedError();
        goto LABEL_15;
      }
    }
    else
    {
      _HKInitializeLogging();
      v16 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v8;
        _os_log_fault_impl(&dword_1B7802000, v16, OS_LOG_TYPE_FAULT, "HDKeyValueEntity SyncIdentity from received codable is nil %{public}@", buf, 0xCu);
      }
      v12 = v8;
      if (!v12)
        goto LABEL_15;
      if (!a3)
        goto LABEL_8;
    }
    v12 = objc_retainAutorelease(v12);
    *a3 = v12;
    goto LABEL_15;
  }
  v10 = 1;
LABEL_17:

  return v10;
}

+ (BOOL)_insertCodableTimestampedKeyValuePairs:(id)a3 domain:(id)a4 category:(int64_t)a5 provenance:(int64_t)a6 syncIdentity:(int64_t)a7 profile:(id)a8 error:(id *)a9
{
  return objc_msgSend(a1, "_insertCodableTimestampedKeyValuePairs:domain:category:provenance:syncIdentity:updatePolicy:profile:error:", a3, a4, a5, a6, a7, 2, a8, a9);
}

+ (BOOL)_insertCodableTimestampedKeyValuePairs:(id)a3 domain:(id)a4 category:(int64_t)a5 provenance:(int64_t)a6 syncIdentity:(int64_t)a7 updatePolicy:(int64_t)a8 profile:(id)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  id v36;
  int64_t v37;
  int64_t v38;
  int64_t v39;
  int64_t v40;
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a9;
  v19 = objc_msgSend(v16, "count");
  if (v19)
  {
    v20 = v19;
    v36 = a1;
    v37 = a8;
    v38 = a7;
    v39 = a5;
    v40 = a6;
    v41 = v18;
    v42 = v17;
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v19);
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v20);
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v20);
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v43 = v16;
    v24 = v16;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v45 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend(v29, "decodedValue");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            objc_msgSend(v21, "addObject:", v30);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v31);

          }
          objc_msgSend(v29, "key");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v32);

          objc_msgSend(v29, "decodedTimestamp");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v33);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      }
      while (v26);
    }

    v18 = v41;
    v17 = v42;
    v34 = objc_msgSend(v36, "_insertValues:forKeys:modificationDates:domain:category:provenance:syncIdentity:updatePolicy:profile:error:", v21, v22, v23, v42, v39, v40, v38, v37, v41, a10);

    v16 = v43;
  }
  else
  {
    v34 = 1;
  }

  return v34;
}

id __130__HDKeyValueEntity__doInsertValues_forKeys_modificationDates_domain_category_provenance_syncIdentity_updatePolicy_database_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v5[0] = CFSTR("value");
  v5[1] = CFSTR("key");
  v5[2] = CFSTR("domain");
  v5[3] = CFSTR("category");
  v5[4] = CFSTR("provenance");
  v5[5] = CFSTR("mod_date");
  v5[6] = CFSTR("sync_identity");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "insertSQLForProperties:shouldReplace:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __130__HDKeyValueEntity__doInsertValues_forKeys_modificationDates_domain_category_provenance_syncIdentity_updatePolicy_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  sqlite3_bind_int64(a2, 4, *(_QWORD *)(a1 + 56));
  sqlite3_bind_int64(a2, 5, *(_QWORD *)(a1 + 64));
  sqlite3_bind_double(a2, 6, *(double *)(a1 + 72));
  return sqlite3_bind_int64(a2, 7, *(_QWORD *)(a1 + 80));
}

+ (const)_insertStatementKey
{
  NSRequestConcreteImplementation();
  return 0;
}

uint64_t __107__HDKeyValueEntity__validateModificationDatePolicyWithKey_domain_category_modificationDate_database_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 48));
  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  return sqlite3_bind_double(a2, 4, *(double *)(a1 + 56));
}

uint64_t __107__HDKeyValueEntity__validateModificationDatePolicyWithKey_domain_category_modificationDate_database_error___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return 1;
}

+ (BOOL)_insertValues:(id)a3 forKeys:(id)a4 modificationDates:(id)a5 domain:(id)a6 category:(int64_t)a7 provenance:(int64_t)a8 syncIdentity:(int64_t)a9 updatePolicy:(int64_t)a10 profile:(id)a11 error:(id *)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  char v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  int64_t v45;
  int64_t v46;
  int64_t v47;
  int64_t v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  int64_t v55;
  int64_t v56;
  id v57;
  int64_t v58;
  int64_t v59;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a11;
  v22 = objc_msgSend(v18, "count");
  if (objc_msgSend(v17, "count") != v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueEntity.m"), 1037, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[values count] == count"));

  }
  v35 = v22;
  if (objc_msgSend(v19, "count") != v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueEntity.m"), 1038, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[dates count] == count"));

  }
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueEntity.m"), 1039, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("domain != nil"));

  }
  objc_msgSend(v21, "database");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __127__HDKeyValueEntity__insertValues_forKeys_modificationDates_domain_category_provenance_syncIdentity_updatePolicy_profile_error___block_invoke;
  v49[3] = &unk_1E6D0BD08;
  v50 = v21;
  v51 = v20;
  v55 = a7;
  v56 = a9;
  v57 = a1;
  v52 = v17;
  v53 = v18;
  v54 = v19;
  v58 = a8;
  v59 = a10;
  v38[0] = v23;
  v38[1] = 3221225472;
  v38[2] = __127__HDKeyValueEntity__insertValues_forKeys_modificationDates_domain_category_provenance_syncIdentity_updatePolicy_profile_error___block_invoke_2;
  v38[3] = &unk_1E6D0BD30;
  v39 = v53;
  v40 = v52;
  v41 = v54;
  v42 = v51;
  v45 = a7;
  v46 = a8;
  v47 = a9;
  v48 = a10;
  v43 = v50;
  v44 = v35;
  v24 = v50;
  v25 = v51;
  v26 = v54;
  v27 = v52;
  v28 = v53;
  v29 = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v34, a12, v49, v38);

  return v29;
}

BOOL __127__HDKeyValueEntity__insertValues_forKeys_modificationDates_domain_category_provenance_syncIdentity_updatePolicy_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _BOOL8 v16;
  void *v18;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "keyValueDomainManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  objc_msgSend(v5, "batchNotificationForDomain:category:forTransaction:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), v4);

  v7 = *(_QWORD *)(a1 + 80);
  if (v7 == -2)
    v7 = objc_msgSend(*(id *)(a1 + 32), "currentSyncIdentityPersistentID");
  v8 = *(void **)(a1 + 64);
  v18 = *(void **)(a1 + 56);
  v10 = *(void **)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 72);
  v13 = *(_QWORD *)(a1 + 88);
  v12 = *(_QWORD *)(a1 + 96);
  v14 = *(_QWORD *)(a1 + 104);
  objc_msgSend(v6, "databaseForEntityClass:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = +[HDKeyValueEntity _doInsertValues:forKeys:modificationDates:domain:category:provenance:syncIdentity:updatePolicy:database:error:](v13, v9, v18, v8, v10, v11, v12, v7, v14, v15, a3);

  return v16;
}

uint64_t __127__HDKeyValueEntity__insertValues_forKeys_modificationDates_domain_category_provenance_syncIdentity_updatePolicy_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _HDKeyValueJournalEntry *v10;
  void *v11;
  uint64_t v12;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 72));
  if (*(_QWORD *)(a1 + 72))
  {
    v6 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[_HDKeyValueJournalEntry initWithValue:key:domain:category:provenance:syncIdentity:updatePolicy:modificationDate:]([_HDKeyValueJournalEntry alloc], "initWithValue:key:domain:category:provenance:syncIdentity:updatePolicy:modificationDate:", v8, v7, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), v9);
      objc_msgSend(v5, "addObject:", v10);

      ++v6;
    }
    while (v6 < *(_QWORD *)(a1 + 72));
  }
  objc_msgSend(*(id *)(a1 + 64), "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "addJournalEntries:error:", v5, a3);

  return v12;
}

+ (id)_modDateForKey:(id)a3 domain:(id)a4 category:(int64_t)a5 profile:(id)a6 entity:(id *)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[9];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__172;
  v35[4] = __Block_byref_object_dispose__172;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__172;
  v33 = __Block_byref_object_dispose__172;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__172;
  v27 = __Block_byref_object_dispose__172;
  v28 = 0;
  if (v14)
  {
    v37[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __72__HDKeyValueEntity__modDateForKey_domain_category_profile_entity_error___block_invoke;
    v22[3] = &unk_1E6D0BD58;
    v22[4] = v35;
    v22[5] = &v29;
    v22[6] = &v23;
    v22[7] = a7;
    v22[8] = a1;
    v18 = +[HDKeyValueEntity _valuesForKeys:domain:category:profile:error:handler:]((uint64_t)a1, v17, v15, a5, v16, (uint64_t)a8, v22);

  }
  if (a7)
  {
    v19 = (void *)v24[5];
    if (v19)
      *a7 = objc_retainAutorelease(v19);
  }
  v20 = (id)v30[5];
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v35, 8);

  return v20;
}

id __72__HDKeyValueEntity__modDateForKey_domain_category_profile_entity_error___block_invoke(_QWORD *a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqual:", v10))
    v11 = 0;
  else
    v11 = v8;
  objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), v11);

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a4);
  if (a1[7])
  {
    v12 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPersistentID:", a5);
    v13 = *(_QWORD *)(a1[6] + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
  v15 = *(id *)(*(_QWORD *)(a1[4] + 8) + 40);

  return v15;
}

+ (id)databaseTable
{
  NSRequestConcreteImplementation();
  return 0;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 8;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_89;
}

+ (id)uniquedColumns
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("category");
  v3[1] = CFSTR("domain");
  v3[2] = CFSTR("key");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)propertyForSyncIdentity
{
  return CFSTR("sync_identity");
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDKeyValueEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[_HDKeyValueEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDKeyValueEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

@end
